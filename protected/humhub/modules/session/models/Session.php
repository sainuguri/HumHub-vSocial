<?php

namespace humhub\modules\session\models;

use Yii;
use DateTime;
use yii\helpers\Url;
use humhub\libs\DbDateValidator;
use yii\data\ActiveDataProvider;
use humhub\modules\session\components\UrlValidator;
use humhub\modules\content\components\ContentContainerActiveRecord;

/**
 * This is the model class for table "session".
 *
 * @property integer $id
 * @property string $session_name
 * @property string $instructor_name
 * @property string $start_day
 * @property string $end_day
 * @property string $start_time
 * @property string $end_time
 * @property string $url
 * @property string $hf_url

 */
class Session extends ContentContainerActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'session';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        $rules = [
            ['id', 'integer'],
            [['session_name', 'start_day', 'end_day'], 'required'],
            [['start_day', 'end_day'], 'safe'],
            [['start_time','session_name'], 'string', 'max' => 50],
            [['end_time', 'instructor_name'], 'string', 'max' => 45],
            [['url', 'hf_url'], 'unique', 'skipOnEmpty' => 'true'],
            [['url'], UrlValidator::className()],
            [['end_day'], 'validateEndDay'],
            [['end_time'], 'validateEndTime'],
        ];
        if (Yii::$app->getModule('session')->useUniqueSessionNames) {
            $rules[] = [['session_name'], 'unique', 'targetClass' => self::className()];
        }

        return $rules;
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'Session ID',
            'session_name' => 'Session Name',
            'start_day' => 'Start Day',
            'end_day' => 'End Day',
            'start_time' => 'Start Time',
            'end_time' => 'End Time',
            'instructor_name' => 'Instructor Name',
            'hf_url' => 'HighFidelity URL'
        ];
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return array(
            \humhub\components\behaviors\GUID::className(),
            \humhub\modules\content\components\behaviors\SettingsBehavior::className(),
            //\humhub\modules\space\behaviors\SpaceModelModules::className(),
            \humhub\modules\session\behaviors\SessionModelMembership::className(),
            //\humhub\modules\user\behaviors\Followable::className(),
        );
    }

    /**
     * @inheritdoc
     */
    // public function afterSave($insert, $changedAttributes)
    // {
    //     parent::afterSave($insert, $changedAttributes);

    //     //Yii::$app->search->update($this);

    //     $user = \humhub\modules\user\models\User::findOne(['id' => $this->created_by]);

    //     if ($insert) {
    //         // Auto add creator as admin
    //         $membership = new SessionMembership();
    //         $membership->session_id = $this->session_id;
    //         $membership->user_id = $user->id;
    //         $membership->status = SessionMembership::STATUS_MEMBER;
    //         //$membership->group_id = self::USERGROUP_ADMIN;
    //         $membership->save();

    //         // $activity = new \humhub\modules\space\activities\Created;
    //         // $activity->source = $this;
    //         // $activity->originator = $user;
    //         // $activity->create();
    //     }

    //     //Yii::$app->cache->delete('userSpaces_' . $user->id);
    // }

    public function getSessionMembers()
    {
        $query = $this->hasMany(SessionMembership::className(), ['session_id' => 'id']);
        return $query;
    }

    public function createUrl($route = null, $params = array(), $scheme = false)
    {
        if ($route == null) {
            $route = '/session/info';
        }

        array_unshift($params, $route);
        if (!isset($params['sessionguid'])) {
            $params['sessionguid'] = $this->guid;
        }

        return Url::toRoute($params, $scheme);
    }

    public function validateEndDay($attribute, $params)
    {
        if (new DateTime($this->start_day) > new DateTime($this->end_day)) {
            $this->addError($attribute, Yii::t('CalendarModule.base', "End day must be after start day!"));
        }
    }

    public function validateEndTime($attribute, $params)
    {
        if (new DateTime($this->start_time) >= new DateTime($this->end_time)) {
            $this->addError($attribute, Yii::t('CalendarModule.base', "End time must be after start time!"));
        }
    }

}

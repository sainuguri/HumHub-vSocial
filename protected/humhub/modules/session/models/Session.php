<?php

namespace humhub\modules\session\models;

use Yii;
use yii\data\ActiveDataProvider;

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

 */
class Session extends \yii\db\ActiveRecord
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
        return [
            ['id', 'integer'],
            [['start_day', 'end_day'], 'safe'],
            [['start_time','session_name'], 'string', 'max' => 50],
            [['end_time', 'instructor_name'], 'string', 'max' => 45]
        ];
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
        ];
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return array(
            //\humhub\components\behaviors\GUID::className(),
            //\humhub\modules\content\components\behaviors\SettingsBehavior::className(),
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

    public function search($params)
    {
        $query = Session::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['pageSize' => 50],
        ]);

        $dataProvider->setSort([
            'attributes' => [
                'id',
                'session_name',
                'start_day',
                'end_day',
                'start_time',
                'end_time',
                'instructor_name',
            ]
        ]);

        $this->load($params);

        if (!$this->validate()) {
            $query->where('0=1');
            return $dataProvider;
        }
        $query->andFilterWhere(['id' => $this->id]);
        $query->andFilterWhere(['session_name' => $this->session_name]);
        $query->andFilterWhere(['start_day' => $this->start_day]);
        $query->andFilterWhere(['end_day' => $this->end_day]);
        $query->andFilterWhere(['start_time' => $this->start_time]);
        $query->andFilterWhere(['end_time' => $this->end_time]);
        $query->andFilterWhere(['like', 'instructor_name', $this->instructor_name]);

        return $dataProvider;
    }

}

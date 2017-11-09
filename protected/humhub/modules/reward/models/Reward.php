<?php

namespace humhub\modules\reward\models;

use Yii;
use humhub\modules\session\models\Session;
use humhub\modules\user\models\User;

/**
 * This is the model class for table "reward".
 *
 * @property integer $id
 * @property string $guid
 * @property integer $user_id
 * @property integer $session_id
 * @property string $description
 * @property string $rewarded_date
 * @property integer $rewarded_by
 *
 * @property Session $session
 * @property User $user
 */
class Reward extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'reward';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'session_id', 'rewarded_by'], 'required'],
            [['user_id', 'session_id', 'rewarded_by'], 'integer'],
            [['rewarded_date'], 'safe'],
            [['guid', 'description'], 'string', 'max' => 45],
            [['session_id'], 'exist', 'skipOnError' => true, 'targetClass' => Session::className(), 'targetAttribute' => ['session_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return array(
            \humhub\components\behaviors\GUID::className(),
        );
    }


    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'guid' => 'Guid',
            'user_id' => 'User ID',
            'session_id' => 'Session ID',
            'description' => 'Description',
            'rewarded_date' => 'Rewarded Date',
            'rewarded_by' => 'Rewarded By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSession()
    {
        return $this->hasOne(Session::className(), ['id' => 'session_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    public function createUrl($route = null, $params = array(), $scheme = false)
    {
        if ($route == null) {
            $route = '/reward/info';
        }

        array_unshift($params, $route);
        if (!isset($params['rewardguid'])) {
            $params['rewardguid'] = $this->guid;
        }

        return Url::toRoute($params, $scheme);
    }
}

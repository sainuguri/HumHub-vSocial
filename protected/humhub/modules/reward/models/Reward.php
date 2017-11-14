<?php

namespace humhub\modules\reward\models;

use Yii;
use humhub\modules\user\models\User;
use humhub\modules\session\models\Tokens;
use humhub\modules\session\models\Session;
use humhub\modules\content\components\ContentContainerActiveRecord;

/**
 * This is the model class for table "reward".
 *
 * @property integer $id
 * @property string $guid
 * @property string $description
 * @property integer $user_id
 * @property string $rewarded_date
 * @property integer $session_id
 * @property integer $rewarded_by
 * @property integer $contentcontainer_id
 * @property string $url
 * @property integer $token_id
 *
 * @property Session $session
 * @property Tokens $token
 * @property User $user
 */
class Reward extends ContentContainerActiveRecord
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
            [['user_id', 'session_id'], 'required'],
            [['user_id', 'session_id', 'rewarded_by', 'contentcontainer_id', 'token_id'], 'integer'],
            [['rewarded_date'], 'safe'],
            [['guid', 'description', 'url'], 'string', 'max' => 45],
            [['session_id'], 'exist', 'skipOnError' => true, 'targetClass' => Session::className(), 'targetAttribute' => ['session_id' => 'id']],
            [['token_id'], 'exist', 'skipOnError' => true, 'targetClass' => Tokens::className(), 'targetAttribute' => ['token_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

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
            'description' => 'Description',
            'user_id' => 'User ID',
            'rewarded_date' => 'Rewarded Date',
            'session_id' => 'Session ID',
            'rewarded_by' => 'Rewarded By',
            'rewardcol' => 'Rewardcol',
            'token.pass' => 'Pass',
            'token.strike' => 'Strike',
            'contentcontainer_id' => 'Contentcontainer ID',
            'url' => 'Url',
            'token_id' => 'Token ID',
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
    public function getToken()
    {
        return $this->hasOne(Tokens::className(), ['id' => 'token_id']);
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
            $route = '/reward/reward';
        }

        array_unshift($params, $route);
        if (!isset($params['rewardguid'])) {
            $params['rewardguid'] = $this->guid;
        }

        return Url::toRoute($params, $scheme);
    }
}

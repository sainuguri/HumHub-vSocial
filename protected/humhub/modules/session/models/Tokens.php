<?php

namespace humhub\modules\session\models;

use Yii;

/**
 * This is the model class for table "tokens".
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $tokens
 * @property integer $session_id
 *
 * @property Session $session
 */
class Tokens extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tokens';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'session_id'], 'required'],
            [['user_id', 'tokens', 'session_id'], 'integer'],
            [['session_id'], 'exist', 'skipOnError' => true, 'targetClass' => Session::className(), 'targetAttribute' => ['session_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'tokens' => 'Tokens',
            'session_id' => 'Session ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSession()
    {
        return $this->hasOne(Session::className(), ['id' => 'session_id']);
    }
}

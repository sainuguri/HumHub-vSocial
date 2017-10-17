<?php

namespace humhub\modules\user\models;

use Yii;

/**
 * This is the model class for table "instructor".
 *
 * @property integer $id
 * @property integer $user_id
 * @property string $instructor_name
 */
class Instructor extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'instructor';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id'], 'required'],
            [['user_id'], 'integer'],
            [['instructor_name'], 'string', 'max' => 50],
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
            'instructor_name' => 'Instructor Name',
        ];
    }
}

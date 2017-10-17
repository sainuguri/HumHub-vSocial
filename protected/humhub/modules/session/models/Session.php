<?php

namespace humhub\modules\session\models;

use Yii;
use yii\data\ActiveDataProvider;

/**
 * This is the model class for table "session".
 *
 * @property integer $session_id
 * @property string $start_day
 * @property string $end_day
 * @property string $start_time
 * @property string $end_time
 * @property string $instructor_name
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
            [['start_day', 'end_day'], 'safe'],
            [['start_time'], 'string', 'max' => 50],
            [['end_time', 'instructor_name'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'session_id' => 'Session ID',
            'start_day' => 'Start Day',
            'end_day' => 'End Day',
            'start_time' => 'Start Time',
            'end_time' => 'End Time',
            'instructor_name' => 'Instructor Name',
        ];
    }

    public function search($params)
    {
        $query = Session::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['pageSize' => 50],
        ]);

        $dataProvider->setSort([
            'attributes' => [
                'session_id',
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
        $query->andFilterWhere(['session_id' => $this->session_id]);
        $query->andFilterWhere(['start_day' => $this->start_day]);
        $query->andFilterWhere(['end_day' => $this->end_day]);
        $query->andFilterWhere(['start_time' => $this->start_time]);
        $query->andFilterWhere(['end_time' => $this->end_time]);
        $query->andFilterWhere(['like', 'instructor_name', $this->instructor_name]);

        return $dataProvider;
    }

}

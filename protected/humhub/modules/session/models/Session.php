<?php

namespace humhub\modules\session\models;

use Yii;
use yii\data\ActiveDataProvider;

/**
 * This is the model class for table "session".
 *
 * @property integer $session_id
 * @property string $start_time
 * @property string $end_time
 * @property integer $instructor_id
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
            [['start_time', 'end_time'], 'safe'],
            [['instructor_id'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'session_id' => 'Session ID',
            'start_time' => 'Start Time',
            'end_time' => 'End Time',
            'instructor_id' => 'Instructor ID',
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
                'start_time',
                'end_time',
                'instructor_id',
            ]
        ]);

        $this->load($params);

        if (!$this->validate()) {
            $query->where('0=1');
            return $dataProvider;
        }
        $query->andFilterWhere(['session_id' => $this->session_id]);
        $query->andFilterWhere(['start_time' => $this->start_time]);
        $query->andFilterWhere(['end_time' => $this->end_time]);
        $query->andFilterWhere(['like', 'instructor_id', $this->instructor_id]);

        return $dataProvider;
    }
}

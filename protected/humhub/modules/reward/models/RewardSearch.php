<?php

namespace humhub\modules\reward\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use humhub\modules\reward\models\Reward;

/**
 * RewardSearch represents the model behind the search form about `humhub\modules\reward\models\Reward`.
 */
class RewardSearch extends Reward
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'user_id', 'session_id', 'rewarded_by'], 'integer'],
            [['description', 'rewarded_date'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Reward::find();
        $query->join('LEFT JOIN', 'user', 'user.id=reward.user_id');
        $query->join('LEFT JOIN', 'session', 'session.id=reward.session_id');

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $dataProvider->setSort([
            'attributes' => [
                'id',
                'user.username',
                'session.session_name',
                'description',
                'rewarded_date',
                'rewarded_by'
            ]
        ]);


        $this->load($params);

        if (!$this->validate()) {
            // comment the following line if you want to return any records when validation fails
            $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'user_id' => $this->user_id,
            'session_id' => $this->session_id,
            'rewarded_date' => $this->rewarded_date,
            'rewarded_by' => $this->rewarded_by,
        ]);

        // $query->andFilterWhere(['like', 'id', $this->id])
        //     ->andFilterWhere(['like', 'user.username', $this->getAttribute('user.username')])
        //     ->andFilterWhere(['like', 'session.session_name', $this->getAttribute('session.session_name')])
        //     ->andFilterWhere(['like', 'description', $this->description])
        //     ->andFilterWhere(['like', 'rewarded_date', $this->rewarded_date])
        //     ->andFilterWhere(['rewarded_by', 'id', $this->rewarded_by]);

        return $dataProvider;
    }
}

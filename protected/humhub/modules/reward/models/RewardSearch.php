<?php

namespace humhub\modules\reward\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use humhub\modules\user\models\User;
use humhub\modules\reward\models\Reward;
use humhub\modules\session\models\Tokens;

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
        // $query->join('LEFT JOIN', 'session_membership', 'session_membership.user_id=user.id');

        $user = User::findOne(['id' => Yii::$app->user->id]);
        $role = $user->getRoleName();

        if ($role == 'Student')
        {
            $query = Reward::find();
            $query->join('LEFT JOIN', 'tokens', 'tokens.id=reward.token_id')->where(['reward.user_id' => Yii::$app->user->id]);    
        }
        else {
            $query = Reward::find();
            $query->join('LEFT JOIN', 'tokens', 'tokens.id=reward.token_id');
        }


        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['pageSize' => 10]
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $dataProvider->setSort([
            'attributes' => [
                'id',
                'user.username',
                'session.session_name',
                'token.pass',
                'token.strike',
                'token.tokens',
                'description',
                'rewarded_date',
                'rewarded_by'
            ]
        ]);



        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'user_id' => $this->user_id,
            'rewarded_date' => $this->rewarded_date,
            'session_id' => $this->session_id,
            'rewarded_by' => $this->rewarded_by,
        ]);

        // $query->andFilterWhere(['like', 'guid', $this->guid])
        //     ->andFilterWhere(['like', 'description', $this->description]);

        return $dataProvider;
    }
}

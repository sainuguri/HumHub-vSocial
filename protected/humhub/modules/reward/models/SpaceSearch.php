<?php


namespace humhub\modules\reward\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use humhub\modules\space\models\Space;

class SpaceSearch extends Space
{

    public function rules()
    {
        return [
            [['id', 'visibility', 'join_policy'], 'integer'],
            [['name'], 'safe'],
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
        $query = Space::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['pageSize' => 50],
        ]);

        $dataProvider->setSort([
            'attributes' => [
                'id',
                'name',
                'visibility',
                'join_policy',
            ]
        ]);

        $this->load($params);

        if (!$this->validate()) {
            $query->where('0=1');
            return $dataProvider;
        }
        if (Yii::$app->user->isAdmin()){
            $query->andFilterWhere(['id' => $this->id]);
            $query->andFilterWhere(['join_policy' => $this->join_policy]);
            $query->andFilterWhere(['visibility' => $this->visibility]);
            $query->andFilterWhere(['like', 'name', $this->name]);
        }else if (Yii::$app->user->isManager()){
            $query->andFilterWhere(['id' => $this->id]);
            $query->andFilterWhere(['join_policy' => $this->join_policy]);
            $query->andFilterWhere(['visibility' => $this->visibility]);
            $query->andFilterWhere(['like', 'name', $this->name]);
        }

        return $dataProvider;
    }

}
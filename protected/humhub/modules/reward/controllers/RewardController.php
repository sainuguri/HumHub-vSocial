<?php

namespace humhub\modules\reward\controllers;

use Yii;
use humhub\modules\reward\models\Reward;
use humhub\modules\reward\models\RewardSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * RewardController implements the CRUD actions for Reward model.
 */
class RewardController extends Controller
{

    /**
     * Lists all Reward models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new RewardSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        if(isset($_POST["rewardID"]) && isset($_POST["description"])){

            $rewardID = $_POST["rewardID"];
            $description = $_POST["description"];
            // $rewarded_date = $_POST["rewarded_date"];
            // $rewarded_by = $_POST["rewarded_by"];

            $tokenModel = Reward::findOne(['id' => $rewardID]);
            $tokenModel->description = $description;
            print_r(date("Y-m-d"));
            $tokenModel->rewarded_date = date("Y-m-d");
            $tokenModel->rewarded_by = Yii::$app->user->id;
            $tokenModel->save();

            return $this->render('index', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);

        }

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Reward model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Reward model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Reward();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Reward model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionEdit($id)
    {
        // $model = $this->findModel($id);

        // if ($model->load(Yii::$app->request->post()) && $model->save()) {
        //     return $this->redirect(['view', 'id' => $model->id]);
        // } else {
        //     return $this->render('update', [
        //         'model' => $model,
        //     ]);
        // }

        return $this->render('edit');
    }
}

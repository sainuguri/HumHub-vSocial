<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model humhub\modules\reward\models\Reward */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Rewards', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="reward-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'guid',
            'description',
            'user_id',
            'rewarded_date',
            'session_id',
            'rewarded_by',
        ],
    ]) ?>

</div>

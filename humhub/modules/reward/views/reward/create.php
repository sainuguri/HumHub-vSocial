<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model humhub\modules\reward\models\Reward */

$this->title = 'Create Reward';
$this->params['breadcrumbs'][] = ['label' => 'Rewards', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="reward-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

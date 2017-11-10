<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model humhub\modules\reward\models\Reward */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="reward-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'guid')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'description')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'user_id')->textInput() ?>

    <?= $form->field($model, 'rewarded_date')->textInput() ?>

    <?= $form->field($model, 'session_id')->textInput() ?>

    <?= $form->field($model, 'rewarded_by')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

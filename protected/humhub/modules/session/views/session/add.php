<?php

use humhub\libs\Html;
use yii\helpers\ArrayHelper;
use \humhub\compat\CHtml;
use yii\jui\DatePicker;
use yii\widgets\ActiveForm;
use humhub\widgets\TimePicker;
use humhub\modules\user\models\Instructor;
humhub\assets\TabbedFormAsset::register($this);
?>

<div class="container">
        <div class="col-md-12 layout-content-container panel panel-default">
        <div class="panel-body">
        	<div class="clearfix">
        		<?= Html::backButton(['index'], ['label' => Yii::t('AdminModule.base', 'Back to overview'), 'class' => 'pull-right']); ?>
        		<h4 class="pull-left"><?= Yii::t('AdminModule.views_user_index', '<strong>Create</strong> New Session'); ?></h4>
    		</div>
    		<br>
        <?php $form = ActiveForm::begin();?>

            <div class="row">
              <div class="col-md-6">
                <?= $form->field($model, 'start_day')->widget(DatePicker::className(), ['dateFormat' => 'yyyy-MM-dd', 'clientOptions' => [], 'options' => ['class' => 'form-control']])->label('Start Day') ?>
              </div>
              <div class="col-md-6 timeField">
                <?= $form->field($model, 'start_time')->widget(TimePicker::class)->label('Start Time'); ?>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <?= $form->field($model, 'end_day')->widget(DatePicker::className(), ['dateFormat' => 'yyyy-MM-dd', 'clientOptions' => [], 'options' => ['class' => 'form-control']])->label('End Day') ?>
              </div>
              <div class="col-md-6 timeField">
                <?= $form->field($model, 'end_time')->widget(TimePicker::class)->label('End Time') ?>
              </div>
            </div>

            <div class="row">
              <div class="col-md-12">
                <?= $form->field($model,'instructor_name')->dropdownList(
                  ArrayHelper::map(Instructor::find()->all(),'instructor_name','instructor_name'),
                ['prompt'=>'Select Instructor'])->label('Instructor');?>
              </div>
            </div>
              <?= \humhub\modules\user\widgets\UserPickerField::widget([])?>
            </br>
            <div class="form-group">
              <?= CHtml::submitButton(Yii::t('SessionModule.views_session_add', 'Save'), ['class' => 'btn btn-primary', 'data-ui-loader' => ""]); ?>
            </div>

        <?php ActiveForm::end(); ?>    		
        </div>
        </div>
</div>
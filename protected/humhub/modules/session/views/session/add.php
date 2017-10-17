<?php

use humhub\libs\Html;
use \humhub\compat\CHtml;
use yii\jui\DatePicker;
use yii\widgets\ActiveForm;
use humhub\widgets\TimePicker;
humhub\assets\TabbedFormAsset::register($this);
?>

<div class="container">
        <div class="col-md-12 layout-content-container panel panel-default">
        <div class="panel-body">
        	<div class="clearfix">
        		<?= Html::backButton(['index'], ['label' => Yii::t('AdminModule.base', 'Back to overview'), 'class' => 'pull-right']); ?>
        		<h4 class="pull-left"><?= Yii::t('AdminModule.views_user_index', '<strong>Create</strong> New Session'); ?></h4>
                <div class="pull-right">
                    <?= Html::a('<i class="fa fa-paper-plane" aria-hidden="true"></i>&nbsp;&nbsp;' . Yii::t('AdminModule.views_user_index', 'Send invite'), ['/user/invite'], ['class' => 'btn btn-success', 'data-target' => '#globalModal']); ?>
                </div>
    		</div>
    		<br>
        <?php $form = ActiveForm::begin();?>

            <div class="row">
              <div class="col-md-6">
                <?= $form->field($model, 'start_time')->widget(DatePicker::className(), ['dateFormat' => Yii::$app->params['formatter']['defaultDateFormat'], 'clientOptions' => [], 'options' => ['class' => 'form-control']])->label('Start Day') ?>
              </div>
              <div class="col-md-6 timeField">
                <?= $form->field($model, 'start_time')->widget(TimePicker::class)->label('Start Time'); ?>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <?= $form->field($model, 'end_time')->widget(DatePicker::className(), ['dateFormat' => Yii::$app->params['formatter']['defaultDateFormat'], 'clientOptions' => [], 'options' => ['class' => 'form-control']])->label('End Day') ?>
              </div>
              <div class="col-md-6 timeField">
                <?= $form->field($model, 'end_time')->widget(TimePicker::class)->label('End Time') ?>
              </div>
            </div>

            <div class="row">
              <div class="col-md-12">
                <?= $form->field($instructorModel,'instructor_name')->dropdownList(['prompt'=>'Select Instructor'])->label('Instructor');?>
              </div>
            </div>
              <?= \humhub\modules\user\widgets\UserPickerField::widget([])?>
            </br>
            <div class="form-group">
              <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
            </div>


        <?php ActiveForm::end(); ?>    		
        </div>
        </div>
</div>
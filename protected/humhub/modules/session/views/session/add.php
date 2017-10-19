<?php

use yii\helpers\Url;
use humhub\libs\Html;
use yii\helpers\ArrayHelper;
use \humhub\compat\CHtml;
use yii\jui\DatePicker;
use yii\widgets\ActiveForm;
use humhub\widgets\TimePicker;
use humhub\modules\user\models\Instructor;

use humhub\widgets\ModalButton;
use humhub\widgets\ModalDialog;

$animation = $model->hasErrors() ? 'shake' : 'fadeIn';

?>
<?php ModalDialog::begin(['header' => Yii::t('SpaceModule.views_create_create', '<strong>Create</strong> New Session'), 'size' => 'small']) ?>
        <?php $form = ActiveForm::begin();?>
          <div class="modal-body">
            <div class="row">
              <div class="col-md-12">
                <?= $form->field($model, 'session_name')->textInput()->label('Session Name') ?>
              </div>
            </div>
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
            </br>
            <div class="form-group">
              <!-- <?= CHtml::submitButton(Yii::t('SessionModule.views_session_add', 'Next'), ['class' => 'btn btn-primary', 'data-ui-loader' => ""]); ?> -->

            </div>

            <div class="modal-footer">
              <?= ModalButton::submitModal(Url::to(['/session/session/add']), Yii::t('SessionModule.views_session_add', 'Next')) ?>
              <?php /** ModalButton::submitModal(Url::to(['/space/create/create', 'skip' => 1]), Yii::t('SpaceModule.views_create_create', 'Skip'))
                ->setType('default')->icon('fa-forward', true)->cssClass('tt')->options(['title' => Yii::t('SpaceModule.views_create_create', 'Skip other steps')]) */?>
            </div>
          </div>
        <?php ActiveForm::end(); ?>
<?php ModalDialog::end(); ?>
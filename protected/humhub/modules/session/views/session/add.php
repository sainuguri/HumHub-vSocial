<?php

use humhub\libs\Html;
use yii\widgets\ActiveForm;
humhub\assets\TabbedFormAsset::register($this);
?>

<div class="container">
        <div class="col-md-12 layout-content-container panel panel-default">
        <div class="panel-body">
        	<div class="clearfix">
        		<?= Html::backButton(['index'], ['label' => Yii::t('AdminModule.base', 'Back to overview'), 'class' => 'pull-right']); ?>
        		<h4 class="pull-left"><?= Yii::t('AdminModule.views_user_index', 'Create New Session'); ?></h4>
                <div class="pull-right">
                    <?= Html::a('<i class="fa fa-paper-plane" aria-hidden="true"></i>&nbsp;&nbsp;' . Yii::t('AdminModule.views_user_index', 'Send invite'), ['/user/invite'], ['class' => 'btn btn-success', 'data-target' => '#globalModal']); ?>
                </div>
    		</div>
    		<br>
            <?php $form = ActiveForm::begin();?>
                <?= $form->field($model, 'start_time')->textInput()->label('Start Time'); ?>
            <?= $form->field($model, 'end_time')->textInput()->label('End Time'); ?>
 
<!--     <div class="form-group">
        <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
    </div> -->
 
<?php ActiveForm::end(); ?>



<p><label>Start Time</label>:</p>
  <?= Html::encode($model->start_time) ?>
  <p><label>End Time</label>:</p>
  <?= Html::encode($model->end_time) ?>
  <p><label>Instructor ID</label>:</p>
  <?= Html::encode($model->instructor_id) ?>
<br /><br />
    		
        </div>
        </div>
</div>
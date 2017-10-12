<?php

use humhub\libs\Html;

humhub\assets\TabbedFormAsset::register($this);
?>

<div class="container">
        <div class="col-md-12 layout-content-container panel panel-default">
        	<div class="clearfix">
        		<?= Html::backButton(['index'], ['label' => Yii::t('AdminModule.base', 'Back to overview'), 'class' => 'pull-right']); ?>
        		<h4 class="pull-left"><?= Yii::t('AdminModule.views_user_index', 'Create New Session'); ?></h4>
    		</div>
    		<br>
    		<?php $form = \yii\widgets\ActiveForm::begin(['options' => ['data-ui-widget' => 'ui.form.TabbedForm', 'data-ui-init' => '']]); ?>
    		<?= $hForm->render($form); ?>
    		<?php \yii\widgets\ActiveForm::end(); ?>
        </div>
</div>
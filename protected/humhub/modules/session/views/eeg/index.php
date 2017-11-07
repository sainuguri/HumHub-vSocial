<?php

use yii\helpers\Html;

?>

<h4><?= Yii::t('SessionModule.views_space_index', 'Overview'); ?></h4>
<div class="help-block">
    <?= Yii::t('AdminModule.views_space_index', 'This overview contains a list of each space with actions to view, edit and delete spaces.'); ?>
</div>

<div class="table-responsive">
    <?= Html::a('<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;&nbsp;' . Yii::t('AdminModule.space', 'Add new space'), ['/space/create'], ['class' => 'btn btn-success pull-right', 'data-target' => '#globalModal']); ?>
</div>

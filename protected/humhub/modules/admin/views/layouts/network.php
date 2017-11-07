<?php $this->beginContent('@admin/views/layouts/main.php') ?>
<div class="panel panel-default">
    <div class="panel-heading">
        <?= Yii::t('AdminModule.user', '<strong>Network</strong> Information'); ?>
    </div>

    <?= $content; ?>
</div>
<?php $this->endContent(); ?>
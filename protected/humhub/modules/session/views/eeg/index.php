<?php

use yii\helpers\Html;
$session = $this->context->contentContainer;
?>

<?php $this->beginContent('@humhub/modules/session/views/info/main.php') ?>
<div class="container">
	<div class="col-md-10 panel layout-content-container">
	        <?= \humhub\modules\session\widgets\EEGContent::widget([
	              	'contentContainer' => $session
	        ]) ?>
    </div>
</div>
<?php $this->endContent(); ?>

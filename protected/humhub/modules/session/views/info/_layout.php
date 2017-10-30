<?php

$session = $this->context->contentContainer;
?>
<div class="container session-layout-container">
    <div class="row">
        <div class="col-md-12">
            <?php echo humhub\modules\session\widgets\Header::widget(['session' => $session]); ?>

        </div>
    </div>
</div>

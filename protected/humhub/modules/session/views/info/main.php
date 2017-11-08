<?php

$session = $this->context->contentContainer;
?>
<div class="container session-layout-container">
    <div class="row">
        <div class="col-md-12">
            <?php echo humhub\modules\session\widgets\Header::widget(['session' => $session]); ?>

        </div>
    </div>
    <div class="row">
        <div class="col-md-2 layout-nav-container">
            <?php echo \humhub\modules\session\widgets\Menu::widget(['session' => $session]); ?>
            <br>
        </div>
            <?= $content; ?>
    </div>
</div>

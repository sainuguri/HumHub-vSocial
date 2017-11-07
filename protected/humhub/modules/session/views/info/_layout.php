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
        <div class="container">
            <div class="col-md-10 panel layout-content-container">
                <?= \humhub\modules\session\widgets\SessionContent::widget([
                    'contentContainer' => $session,
                    'content' => $content
                ]) ?>
            </div>
        </div>
    </div>
</div>

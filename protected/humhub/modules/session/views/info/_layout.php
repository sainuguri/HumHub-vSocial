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
        <div class="container">
            <div class="col-md-12 panel layout-content-container">
                <?= \humhub\modules\session\widgets\SessionContent::widget([
                    'contentContainer' => $session,
                    'content' => $content
                ]) ?>
            </div>
        </div>
            <!-- <div class="col-md-3 layout-sidebar-container">
                <?php
                echo \humhub\modules\session\widgets\Sidebar::widget(['session' => $session, 'widgets' => [
                        [\humhub\modules\session\widgets\Members::className(), ['session' => $session], ['sortOrder' => 30]]
                ]]);
                ?>
            </div> -->
    </div>
</div>

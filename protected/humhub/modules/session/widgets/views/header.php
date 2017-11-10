<?php

use yii\helpers\Html;
?>

<div class="panel panel-default panel-profile">

    <div class="panel-profile-header">

        <div class="image-upload-container" style="width: 100%; height: 100%; overflow:hidden;">
            <!-- profile image output-->
            <img class="img-profile-header-background" id="session-banner-image"
                 src="<?php echo $session->getProfileBannerImage()->getUrl(); ?>"
                 width="100%" style="width: 100%;">

            <div class="img-profile-data">
                <h1 class="session"><?php echo Html::encode($session->session_name); ?></h1>

                <h2 class="session"><?php echo Html::encode($session->instructor_name); ?></h2>
            </div>
        </div>

        <div class="image-upload-container profile-user-photo-container" style="width: 140px; height: 140px;">

            <?php ?>
                <?php echo \humhub\modules\session\widgets\Image::widget(['session' => $session, 'width' => 140]); ?>
            <?php ?>
        </div>


    </div>

    <div class="panel-body">

        <div class="panel-profile-controls">
            <!-- start: User statistics -->
            <div class="row">
                <div class="col-md-12">
                    <div class="statistics pull-left">
                            <div class="pull-left entry">
                                <span class="count"><?= $session->getSessionMembers()->count(); ?></span>
                                <br>
                                <span
                                    class="title"><?= Yii::t('SessionModule.widgets_views_profileHeader', 'Members'); ?></span>
                            </div>
                    </div>
                </div>
            </div>

        </div>


    </div>

</div>
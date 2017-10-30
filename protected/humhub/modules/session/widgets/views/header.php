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

            <!-- check if the current user is the profile owner and can change the images -->
            <?php if ($session->isAdmin()) { ?>
                <form class="fileupload" id="bannerfileupload" action="" method="POST" enctype="multipart/form-data"
                      style="position: absolute; top: 0; left: 0; opacity: 0; width: 100%; height: 100%;">
                    <input type="file" name="bannerfiles[]">
                </form>

                <?php
                // set standard padding for banner progressbar
                $padding = '90px 350px';

                // if the default banner image is displaying
                if (!$session->getProfileBannerImage()->hasImage()) {
                    // change padding to the lower image height
                    $padding = '50px 350px';
                }
                ?>

                <div class="image-upload-loader" id="banner-image-upload-loader"
                     style="padding: <?php echo $padding ?>;">
                    <div class="progress image-upload-progess-bar" id="banner-image-upload-bar">
                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="00"
                             aria-valuemin="0"
                             aria-valuemax="100" style="width: 0%;">
                        </div>
                    </div>
                </div>

            <?php } ?>

            <!-- show user name and title -->
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
<?php
/**
 * @var \humhub\modules\user\models\User $contentContainer
 * @var bool $showProfilePostForm
 */

use yii\helpers\Url;
use yii\helpers\Html;
use \humhub\compat\CHtml;
use yii\widgets\ActiveForm;
use humhub\modules\space\models\Space;

?>


<div class="col-md-12 table-responsive">
    <table class="table table-hover">
        <thead>
            <tr>
                <th style="width: 80%;">Username</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($members as $user) : ?>
                <tr>
                    <td>
                        <?php echo $user->username?>
                    </td>
                    <td>
                        <?php echo Html::a('<i class="fa fa-line-chart " aria-hidden="true"></i>&nbsp;&nbsp;' . Yii::t('AdminModule.views_user_index', 'View EEG Data'), Url::toRoute(['/session/eeg/view', 'sessionguid' => $session->guid]), ['class' => 'btn btn-success', 'data-target' => '#globalModal']); ?>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>



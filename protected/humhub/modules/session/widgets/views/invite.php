<?php

use yii\bootstrap\ActiveForm;
   
?>

<?php $modal = \humhub\widgets\ModalDialog::begin([
    'header' => Yii::t('SpaceModule.views_space_invite', '<strong>Invite</strong> members')
])?>

    <?php $form = ActiveForm::begin(['id' => 'session-invite-modal-form', 'action' => $submitAction]) ?>
        <div class="modal-body">

                <?= Yii::t('SessionModule.views_session_invite', 'To invite users to this session, please type their names below to find and pick them.'); ?>

                <br/><br/>
                <?= \humhub\modules\user\widgets\UserPickerField::widget([
                    'id' => 'session-invite-user-picker',
                    'form' => $form,
                    'model' => $model,
                    'attribute' => 'invite',
                    'url' => $searchUrl,
                    'disabledItems' => [Yii::$app->user->guid],
                    'focus' => true
                ])?>

                <script>
                    $('.tab-internal a').on('shown.bs.tab', function (e) {
                        $('#session-invite-user-picker').data('picker').focus();
                    });

                    $('.tab-external a').on('shown.bs.tab', function (e) {
                        $('#session-invite-external').focus();
                    });
                </script>
        </div>
        <div class="modal-footer">
            <a href="#" data-action-click="ui.modal.submit" data-action-submit class="btn btn-primary"  data-ui-loader><?= $submitText ?></a>
        </div>

    <?php ActiveForm::end() ?>

<?php \humhub\widgets\ModalDialog::end(); ?>
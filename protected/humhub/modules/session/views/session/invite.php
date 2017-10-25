<?= \humhub\modules\session\widgets\Invite::widget([
    'model' => $model,
    'submitText' => Yii::t('SessionModule.views_session_invite', 'Done'),
    'submitAction' => \yii\helpers\Url::to(['/session/session/invite', 'session_id' => $session->id])
]); ?>
<?php
/**
 * @var \humhub\modules\user\models\User $contentContainer
 * @var bool $showProfilePostForm
 */

use DateTime;
use yii\helpers\Url;
use yii\helpers\Html;
use humhub\modules\space\models\Space;
use humhub\modules\admin\widgets\SpaceGridView;
?>

<div class="container">
        <div class="col-md-12 layout-content-container panel panel-default">
        <div class="panel-heading"><?= Yii::t('AdminModule.views_space_index', '<strong>Sessions</strong>'); ?></div>
            <div class="table-responsive">
                <div class="pull-right">
                    <?= Html::a('<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;&nbsp;' . Yii::t('AdminModule.views_user_index', 'Create Session'), ['/session/session/add'], ['class' => 'btn btn-success', 'data-target' => '#globalModal']); ?>
                </div>
                <?php
                    echo SpaceGridView::widget([
                        'dataProvider' => $dataProvider,
                        'filterModel' => $searchModel,
                        'columns' => [
                            [
                                'attribute' => 'id',
                                'options' => ['width' => '40px'],
                                'format' => 'raw',
                                'value' => function($data) {
                                    return $data->id;
                                },
                            ],
                            'session_name',
                            'instructor_name',
                            'start_day',
                            'end_day',
                            'start_time',
                            'end_time',
                            'hf_url',
                            [
                                'header' => Yii::t('AdminModule.views_user_index', 'Actions'),
                                'class' => 'yii\grid\ActionColumn',
                                'options' => ['style' => 'width:80px; min-width:80px;'],
                                'buttons' => [
                                    'view' => function($url, $model) {
                                        return Html::a('<i class="fa fa-eye"></i>', $model->getUrl(), ['class' => 'btn btn-primary btn-xs tt']);
                                    },
                                    'update' => function() {
                                        return;
                                    },
                                    'delete' => function() {
                                        return;
                                    }
                                ],
                            ],
                        ],
                    ]);
                ?>
            </div>
        </div> 
    </div>
</div>
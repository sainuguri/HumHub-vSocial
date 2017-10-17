<?php
/**
 * @var \humhub\modules\user\models\User $contentContainer
 * @var bool $showProfilePostForm
 */
use yii\helpers\Html;
use humhub\modules\space\models\Space;
use humhub\modules\admin\widgets\SpaceGridView;
?>

<div class="container">
        <div class="col-md-12 layout-content-container panel panel-default">
        <div class="panel-heading"><?= Yii::t('AdminModule.views_space_index', '<strong>Sessions</strong>'); ?></div>
            <div class="table-responsive">
                <div class="pull-right">
                    <?= Html::a('<i class="fa fa-plus" aria-hidden="true"></i>&nbsp;&nbsp;' . Yii::t('AdminModule.views_user_index', 'Create Session'), ['/session/session/add'], ['class' => 'btn btn-success', 'data-ui-loader'=>'']); ?>
                </div>
                <?php
                    echo SpaceGridView::widget([
                        'dataProvider' => $dataProvider,
                        'filterModel' => $searchModel,
                        'columns' => [
                            [
                                'attribute' => 'session_id',
                                'options' => ['width' => '40px'],
                                'format' => 'raw',
                                'value' => function($data) {
                                    return $data->session_id;
                                },
                            ],
                            'start_time',
                            'end_time',
                            'instructor',
                            // [
                            //     'attribute' => 'visibility',
                            //     'filter' => \yii\helpers\Html::activeDropDownList($searchModel, 'visibility', array_merge(['' => ''], $visibilities)),
                            //     'options' => ['width' => '40px'],
                            //     'format' => 'raw',
                            //     'value' => function($data) use ($visibilities) {
                            //         if (isset($visibilities[$data->visibility]))
                            //             return $visibilities[$data->visibility];
                            //             return Html::encode($data->visibility);
                            //         },
                            // ],
                            // [
                            //     'attribute' => 'join_policy',
                            //     'options' => ['width' => '40px'],
                            //     'filter' => \yii\helpers\Html::activeDropDownList($searchModel, 'join_policy', array_merge(['' => ''], $joinPolicies)),
                            //     'format' => 'raw',
                            //     'value' => function($data) use ($joinPolicies) {
                            //         if (isset($joinPolicies[$data->join_policy]))
                            //             return $joinPolicies[$data->join_policy];
                            //             return Html::encode($data->join_policy);
                            //         },
                            // ],
                        ],
                    ]);
                ?>
            </div>
        </div> 
    </div>
</div>

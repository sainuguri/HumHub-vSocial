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
        <div class="panel-heading"><?= Yii::t('AdminModule.views_space_index', '<strong>Spaces</strong>'); ?></div>
            <div class="table-responsive">
                <?php
                    $visibilities = [
                        Space::VISIBILITY_NONE => Yii::t('SpaceModule.base', 'Private (Invisible)'),
                        Space::VISIBILITY_REGISTERED_ONLY => Yii::t('SpaceModule.base', 'Public (Visible)'),
                        Space::VISIBILITY_ALL => 'All',
                    ];

                    $joinPolicies = [
                        Space::JOIN_POLICY_NONE => Yii::t('SpaceModule.base', 'Only by invite'),
                        Space::JOIN_POLICY_APPLICATION => Yii::t('SpaceModule.base', 'Invite and request'),
                        Space::JOIN_POLICY_FREE => Yii::t('SpaceModule.base', 'Everyone can enter'),
                    ];

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
                            'name',
                            [
                                'attribute' => 'visibility',
                                'filter' => \yii\helpers\Html::activeDropDownList($searchModel, 'visibility', array_merge(['' => ''], $visibilities)),
                                'options' => ['width' => '40px'],
                                'format' => 'raw',
                                'value' => function($data) use ($visibilities) {
                                    if (isset($visibilities[$data->visibility]))
                                        return $visibilities[$data->visibility];
                                        return Html::encode($data->visibility);
                                    },
                            ],
                            [
                                'attribute' => 'join_policy',
                                'options' => ['width' => '40px'],
                                'filter' => \yii\helpers\Html::activeDropDownList($searchModel, 'join_policy', array_merge(['' => ''], $joinPolicies)),
                                'format' => 'raw',
                                'value' => function($data) use ($joinPolicies) {
                                    if (isset($joinPolicies[$data->join_policy]))
                                        return $joinPolicies[$data->join_policy];
                                        return Html::encode($data->join_policy);
                                    },
                            ],
                            [
                                'header' => Yii::t('AdminModule.views_space_index', 'Actions'),
                                'class' => 'yii\grid\ActionColumn',
                                'options' => ['width' => '80px'],
                                'buttons' => [
                                    'view' => function($url, $model) {
                                        //return Html::a('<i class="fa fa-eye"></i>', $model->getUrl(), ['class' => 'btn btn-primary btn-xs tt']);
                                        return Html::a(Yii::t('AdminModule.views_user_index', 'View'), ['/user/invite'], ['class' => 'btn btn-primary', 'data-ui-loader'=>'']);
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

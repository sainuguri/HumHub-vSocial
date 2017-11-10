<?php
/**
 * @var \humhub\modules\user\models\User $contentContainer
 * @var bool $showProfilePostForm
 */

use yii\helpers\Url;
use yii\helpers\Html;
use humhub\modules\space\models\Space;
use humhub\modules\admin\widgets\SpaceGridView;
?>

<div class="container">
        <div class="col-md-12 layout-content-container panel panel-default">
        <div class="panel-heading"><?= Yii::t('AdminModule.views_space_index', '<strong>Rewards</strong>'); ?></div>
            <div class="table-responsive">
                <?php
                extract($_POST);
                extract($_GET);
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
                            'user.username',
                            'session.session_name',
                            'token.pass',
                            'token.strike',
                            'token.tokens',
                            [
                                'attribute' => 'description',
                                'options' => ['style' => 'width: 15%;'],
                                'format' => 'raw',
                                'value' => function($data) {
                                    return Html::textInput('description', $data->description, ['id' => 'desc'.$data->id, 'class' => 'form-control']);
                                },
                            ],
                            [
                                'attribute' => 'rewarded_date',
                                'options' => ['style' => 'width:10%;'],
                                'format' => 'raw',
                                'value' => function($data) {
                                    if ($data->rewarded_date == null){
                                        return Html::label('No rewards yet!', ['id' => 'rewarded_date'.$data->id, 'class' => 'form-control']);
                                    }else {
                                        return Html::label($data->rewarded_date, ['id' => 'rewarded_date'.$data->id, 'class' => 'form-control']);
                                    }
                                },
                            ],
                            [
                                'attribute' => 'rewarded_by',
                                'options' => ['style' => 'width:12%;'],
                                'format' => 'raw',
                                'value' => function($data) {
                                    return Html::label(Yii::$app->user->getIdentity()->displayName, ['id' => 'rewarded_by'.$data->id, 'class' => 'form-control']);
                                },
                            ],
                            [
                                'header' => Yii::t('AdminModule.views_user_index', 'Actions'),
                                'class' => 'yii\grid\ActionColumn',
                                'options' => ['style' => 'width:80px; min-width:80px;'],
                                'buttons' => [
                                    'view' => function() {
                                        return;
                                    },
                                    'update' => function($url, $model) {
                                            return Html::button('<i class="fa fa-floppy-o fa-lg">&nbsp;Save</i>', ['class' => 'update-rewards btn btn-primary btn-sm tt', 'onclick' => 'abc("desc",'.$model->id.')']);
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


<script type="text/javascript">

    function abc(desc, val)
    {
        var row = $(document.getElementById(desc.concat(val))).parents('tr');
        var rewardID = row.attr('data-key');
        var description = document.getElementById(desc.concat(val)).value;
        // var rewarded_date = document.getElementById(date.concat(val)).value;
        // var rewarded_by = document.getElementById(by.concat(val)).value;

        $.ajax({
            method:'POST',
            data:{rewardID:rewardID, description:description},
            dataType:'text',
            success:function(result){
                // alert(result);
            },
            error:function(XHR, status, error){
                // alert(JSON.stringify(error));
            }
        });
    }
    // $('.update-tokens').click(function(){
    //     var row = $(this).parents('tr');
    //     var tokenID = row.attr('data-key');

        // 
    // });
</script>

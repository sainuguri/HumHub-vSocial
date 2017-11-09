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
use humhub\modules\session\widgets\SessionContent;
use humhub\modules\admin\widgets\SpaceGridView;
?>



<?php

extract($_POST);
extract($_GET);
    echo SpaceGridView::widget([
        'dataProvider' => $dataProvider,
        // 'filterModel' => $searchModel,
        'columns' => [
            'user.username',
            [
                'attribute' => 'pass',
                'options' => ['style' => 'width:100px;'],
                'format' => 'raw',
                'value' => function($data) {
                    return Html::textInput('pass', $data->pass, ['id' => 'pass'.$data->user_id,'class' => 'form-control', 'readOnly' => true]);
                },
            ],
            [
                'header' => Yii::t('AdminModule.views_user_index', 'Actions'),
                'class' => 'yii\grid\ActionColumn',
                'options' => ['style' => 'width:80px; min-width:80px;'],
                'buttons' => [
                    'view' => function($url, $model) {
                        $eleID = 'pass';
                        return Html::button('<i class="fa fa-plus"></i>',['id' => '', 'class' => 'addPass btn btn-success btn-sm tt', 'onclick'=>'addValue("pass",'.$model->user_id.')']);
                    },
                    'update' => function() {
                        return;
                    },
                    'delete' => function($url, $model) {
                        return Html::button('<i class="fa fa-minus"></i>', ['id' => '', 'class' => 'subtractPass btn btn-danger btn-sm tt', 'onclick'=>'subtractValue("pass",'.$model->user_id.')']);
                    }
                ],
            ],
            [
                'attribute' => 'strike',
                'options' => ['style' => 'width:100px;'],
                'format' => 'raw',
                'value' => function($data) {
                    return Html::textInput('strike', $data->strike, ['id' => 'strike'.$data->user_id,'class' => 'form-control', 'readOnly' => true]);
                },
            ],
            [
                'header' => Yii::t('AdminModule.views_user_index', 'Actions'),
                'class' => 'yii\grid\ActionColumn',
                'options' => ['style' => 'width:80px; min-width:80px;'],
                'buttons' => [
                    'view' => function($url, $model) {
                        return Html::button('<i class="fa fa-plus"></i>',['id' => '', 'class' => 'addStrike btn btn-success btn-sm tt', 'onclick'=>'addValue("strike",'.$model->user_id.')']);
                    },
                    'update' => function() {
                        return;
                    },
                    'delete' => function($url, $model) {
                        return Html::button('<i class="fa fa-minus"></i>', ['id' => '', 'class' => 'subtractStrike btn btn-danger btn-sm tt', 'onclick'=>'subtractValue("strike",'.$model->user_id.')']);
                    }
                ],
            ],
            [
            	'attribute' => 'tokens',
                'options' => ['style' => 'width:100px;'],
                'format' => 'raw',
                'value' => function($data) {
                    return Html::textInput('tokens', $data->tokens, ['id' => 'token'.$data->user_id,'class' => 'form-control', 'readOnly' => true]);
                },
            ],
            [
                'header' => Yii::t('AdminModule.views_user_index', 'Actions'),
                'class' => 'yii\grid\ActionColumn',
                'options' => ['style' => 'width:80px; min-width:80px;'],
                'buttons' => [
                    'view' => function($url, $model) {
                        return Html::button('<i class="fa fa-plus"></i>',['id' => '', 'class' => 'addTokens btn btn-success btn-sm tt', 'onclick'=>'addValue("token",'.$model->user_id.')']);
                    },
                    'update' => function() {
                    	return;
                    },
                    'delete' => function($url, $model) {
                        return Html::button('<i class="fa fa-minus"></i>', ['id' => '', 'class' => 'subtractTokens btn btn-danger btn-sm tt', 'onclick'=>'subtractValue("token",'.$model->user_id.')']);
                    }
                ],
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
                            return Html::a('<i class="fa fa-floppy-o fa-lg">&nbsp;Save</i>', $model->session->getUrl(), ['class' => 'update-tokens btn btn-primary btn-sm tt']);
                    },
                    'delete' => function() {
                        return;
                    }
                ],
            ]
        ],
    ]);
?>

<script type="text/javascript">

    var id;

    function add(value)
    {
        return value + 1;
    }

    function subtract(value)
    {
        if (value <= 0)
        {
            value = 0;
        }else {
            value = value - 1;
        }
        return value;
    }

    function addValue(eleID, val)
    {
        id = val;
        var old_value = parseInt(document.getElementById(eleID.concat(id)).value);

        if (eleID == "pass" && old_value == 3)
        {
            document.getElementById(eleID.concat(id)).value = 3;    
        } else {
            document.getElementById(eleID.concat(id)).value = add(old_value);
        }

    }

    function subtractValue(eleID, val)
    {
        id = val;
        var old_value = parseInt(document.getElementById(eleID.concat(id)).value);
        document.getElementById(eleID.concat(id)).value = subtract(old_value);
    }

    $('.update-tokens').click(function(){
        var row = $(this).parents('tr');
        var tokenID = row.attr('data-key');
        var pass = row.find('#pass'.concat(id)).val();
        var strike = row.find('#strike'.concat(id)).val();
        var tokens = row.find('#token'.concat(id)).val();

        $.ajax({
            method:'POST',
            data:{tokenID:tokenID, pass:pass, strike:strike, tokens:tokens},
            dataType:'text',
            success:function(result){
                // alert(result);
            },
            error:function(XHR, status, error){
                // alert(JSON.stringify(error));
            }
        });
    });
</script>

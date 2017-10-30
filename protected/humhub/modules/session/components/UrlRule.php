<?php

namespace humhub\modules\session\components;

use yii\web\UrlRuleInterface;
use yii\base\Object;
use humhub\modules\session\models\Session;

/**
 * Session URL Rule
 *
 * @author luke
 */
class UrlRule extends Object implements UrlRuleInterface
{

    /**
     * @var string default route to space home
     */
    public $defaultRoute = 'session/info';

    /**
     * @var array map with space guid/url pairs
     */
    protected static $sessionUrlMap = [];

    /**
     * @inheritdoc
     */
    public function createUrl($manager, $route, $params)
    {
        if (isset($params['sessionguid'])) {
            if ($route == $this->defaultRoute) {
                $route = '';
            }

            $urlPart = static::getUrlBySessionGuid($params['sessionguid']);
            if ($urlPart !== null) {
                $url = "s/" . urlencode($urlPart) . "/" . $route;
                unset($params['sessionguid']);

                if (!empty($params) && ($query = http_build_query($params)) !== '') {
                    $url .= '?' . $query;
                }
                return $url;
            }
        }
        return false;
    }

    /**
     * @inheritdoc
     */
    public function parseRequest($manager, $request)
    {
        $pathInfo = $request->getPathInfo();
        if (substr($pathInfo, 0, 2) == "s/") {
            $parts = explode('/', $pathInfo, 3);
            if (isset($parts[1])) {
                $session = Session::find()->where(['guid' => $parts[1]])->orWhere(['url' => $parts[1]])->one();
                if ($session !== null) {
                    if (!isset($parts[2]) || $parts[2] == "") {
                        $parts[2] = $this->defaultRoute;
                    }

                    $params = $request->get();
                    $params['sessionguid'] = $session->guid;

                    return [$parts[2], $params];
                }
            }
        }
        return false;
    }

    /**
     * Gets session url name by given guid
     * 
     * @param string $guid
     * @return string|null the space url part
     */
    public static function getUrlBySessionGuid($guid)
    {
        if (isset(static::$sessionUrlMap[$guid])) {
            return static::$sessionUrlMap[$guid];
        }

        $session = Session::findOne(['guid' => $guid]);
        if ($session !== null) {
            static::$sessionUrlMap[$session->guid] = ($session->url != '') ? $session->url : $session->guid;
            return static::$sessionUrlMap[$session->guid];
        }

        return null;
    }

}

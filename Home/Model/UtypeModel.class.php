<?php
/**
 * Created by PhpStorm.
 * User: DingJing
 * Date: 2018/2/27
 * Time: 17:23
 */
namespace Home\Model;
use Think\Model;
require __DIR__ . '/../Common/common.php';
require __DIR__ . '/../Common/utype_parse.php';

class UtypeModel extends Model {

    private $target;
    private $start;
    private $stop;

    protected $tablePrefix = 'utype_';
    protected $tableName;
    protected $fields;
    protected $pk = 'utid';
    protected $connection = array(
        'db_type'  => 'mysql',
        'db_user'  => 'root',
        'db_pwd'   => '123456',
        'db_host'  => '127.0.0.1',
        'db_port'  => '3306',
        'db_name'  => 'user_type',
        'db_charset' => 'utf8',
    );

    public function __construct($req) {
        try {
            $res = json_decode($req, true);
            $this->tableName = $res['table'];
            $this->target = $res['target'];
            $this->start = $res['start'];
            $this->stop = $res['stop'];
            $this->fields = $this->set_fields();
        }catch (\Exception $ex) {
            //
            echo 'error';
        }

        parent::__construct();
    }

    public function getValue() {
        $result = array();
        $field = 'utid, timeStamp';
        foreach ($this->get_sql() as $msql) {
            $bak = array();
            $resData = date_range($this->start, $this->stop);
            $res = $this->where($msql['sql'])->getField($field . ',' . $msql['field'], ';');
            if (($res != null) && ($res != false)) {
                foreach ($res as $key => $value) {
                    $arr = explode(';', $value);
                    $resData[$arr[0]] = $arr[1];
                }
                $bak['exp'] = $msql['exp'];
                $bak['data'] = $resData;
                array_push($result, $bak);
            }
        }
        return $result;
    }

    public function time_range() {
        return array($this->start, $this->stop);
    }

    private function set_fields(){
        switch($this->tableName) {
            case "summary":
                return array('utid', 'freNum', 'nchNum', 'chaNum', 'monNum', 'allNum', 'frePro', 'nchPro', 'chaPro', 'monPro', 'timeStamp');
        }
        return array();
    }

    private function get_sql() {
        $sqlInfo = [];
        switch($this->tableName) {
            case "summary":
                foreach ($this->target as $par) {
                    $m = array();
                    $msql = ' timeStamp >= ' . $this->start . ' AND timeStamp <= ' . $this->stop;
                    $m['exp'] = to_chinese_character($par);
                    $m['sql'] = $msql;
                    $m['field'] = $par;
                    array_push($sqlInfo, $m);
                }
                break;
        }
        return $sqlInfo;
    }


}
DEFINE WAREHOUSE {{ load_wh() }} WAREHOUSE_SIZE='{{ load_wh_size }}' AUTO_SUSPEND={{ auto_suspend_seconds }} AUTO_RESUME=TRUE INITIALLY_SUSPENDED=TRUE COMMENT='Employee load warehouse - {{ environment }}';

DEFINE WAREHOUSE {{ transform_wh() }} WAREHOUSE_SIZE='{{ transform_wh_size }}' AUTO_SUSPEND={{ auto_suspend_seconds }} AUTO_RESUME=TRUE INITIALLY_SUSPENDED=TRUE COMMENT='Employee dbt warehouse - {{ environment }}';

{% macro employee_db() -%}{{ database_base }}{{ env_suffix }}{%- endmacro %}
{% macro load_wh() -%}EMPLOYEE_LOAD_WH{{ env_suffix }}{%- endmacro %}
{% macro transform_wh() -%}EMPLOYEE_TRANSFORM_WH{{ env_suffix }}{%- endmacro %}

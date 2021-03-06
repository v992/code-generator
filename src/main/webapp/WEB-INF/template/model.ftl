package ${packagePath};

/**
 *
 *
 * @author 温欣悦
 * @date ${.now?string["yyyy/MM/dd"]}
 */
public class ${fileName} {
<#if fieldList?? && fieldList?size gt 0>
<#list fieldList as field>

    /**
     * ${field.comment}
     */
    private ${field.attributeType} ${field.attributeName};
</#list>
<#list fieldList as field>

    public ${field.attributeType} get${field.attributeMethodName}() {
        return ${field.attributeName};
    }

    public void set${field.attributeMethodName}(${field.attributeType} ${field.attributeName}) {
        this.${field.attributeName} = ${field.attributeName};
    }
</#list>
</#if>
}


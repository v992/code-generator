package ${packagePath};

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.wen.codegenerator.dto.${tableNameU}DTO;
import com.wen.codegenerator.model.${tableNameU};

/**
 *
 *
 * @author 温欣悦
 * @date ${.now?string["yyyy/MM/dd"]}
 */
@Service
public class ${fileName} {
    <#assign tableNameU = tableName4J?cap_first>
    <#assign tableNameL = tableName4J?uncap_first>
    <#assign pKeyU = primaryKey4J?cap_first>
    <#assign pKeyL = primaryKey4J?uncap_first>
    <#assign daoName = tableNameL + "Dao">
    <#assign dtoNameU = tableNameU + "DTO">
    <#assign dtoNameL = tableNameL + "DTO">

    private final Logger LOGGER = LoggerFactory.getLogger(${fileName}.class);

    @Autowired
    private ${tableNameU}Dao ${daoName};

    private ${dtoNameU} model2DTO(${dtoNameU} model) {
        if (model == null) {
            return null;
        }

        ${dtoNameU} dto = new ${dtoNameU}();
    <#list fieldList as field>
        dto.set${field.attributeMethodName}(model.get${field.attributeMethodName}());
    </#list>
        return dto;
    }
    private ${tableNameU} dto2Model(${dtoNameU} dto) {
        if (dto == null) {
            return null;
        }

        ${tableNameU} model = new ${tableNameU}();
    <#list fieldList as field>
    <#if field.attributeTypePackage == "Integer">
        model.set${field.attributeMethodName}(dto.get${field.attributeMethodName}() == null ? 0 : dto.get${field.attributeMethodName}().intValue());
        <#elseif field.attributeTypePackage == "Long">
        model.set${field.attributeMethodName}(dto.get${field.attributeMethodName}() == null ? 0L : dto.get${field.attributeMethodName}().longValue());
        <#elseif field.attributeTypePackage == "Boolean">
        model.set${field.attributeMethodName}(dto.get${field.attributeMethodName}() == null ? false : dto.get${field.attributeMethodName}().booleanValue());
        <#elseif field.attributeTypePackage == "Double">
        model.set${field.attributeMethodName}(dto.get${field.attributeMethodName}() == null ? 0.0 : dto.get${field.attributeMethodName}().doubleValue());
        <#else>
        model.set${field.attributeMethodName}(dto.get${field.attributeMethodName}());
    </#if>
    </#list>
        return model;
    }

   /**
    * 添加
    *
    * @author wxy
    */
    public String add${tableNameU}(${dtoNameU} ${dtoNameL}) {
        if (StringUtil.isEmpty(${dtoNameL}.get${pKeyU})) {
            ${dtoNameL}.set${pKeyU}(CommonUtil.UUID());
        }
        int rowChanges = ${daoName}.add${tableNameU}(${dtoNameL});
        if (rowChanges <= 0) {
            return null;
        } else {
            return ${dtoNameL}.get${pKeyU};
        }
    }

   /**
    * 根据 ${pKeyL} 删除
    *
    * @return 删除成功的条数
    * @author wxy
    */
    public Integer remove${tableNameU}By{tableNameU}(String ${pKeyL}) {
        int rowChanges = ${daoName}.add${tableNameU}(${dtoNameL});
        if (rowChanges <= 0) {
            return null;
        } else {
            return ${dtoNameL}.get${pKeyU};
        }
    }


    /**
     * 根据 ${pKeyL} 查询
     *
     * @author wxy
     */
    public ${tableNameU}DTO query${tableNameU}By${pKeyU}(String ${pKeyL}) {
        return model2DTO(${daoName}.query${tableNameU}By${pKeyU}(${pKeyL}));
    }




}


package com.zhicloud.ms.vo;

import java.text.ParseException;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.zhicloud.ms.common.util.DateUtil;

@Component("cloudHostWarehouse")
public class CloudHostWarehouse {
	private String id;
	private String cloudHostConfigModelId;
	private String name;
	private String hostTypeName;
	private Integer totalAmount;
	private Integer remainAmount;
	private Integer assignedAmount;
	private String createTime;
	private String modifyTime;
	private Date curCreateDate;
	private Date curModifiedDate;
	private String sysImageName;
	private String poolId;
	private String checkTime;
	private Integer minimum;
	
	private Integer fileType;
	
    private String pool_name;// 资源池名称
    private Integer max_creating;// 最大创建数
    
    /**
	 * 码率，默认为0
	 */
	private Integer codeRate;
	
	/**
	 * 帧率 ,默认为0
	 */
	private Integer frameRate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCloudHostConfigModelId() {
		return cloudHostConfigModelId;
	}
	public void setCloudHostConfigModelId(String cloudHostConfigModelId) {
		this.cloudHostConfigModelId = cloudHostConfigModelId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Integer getRemainAmount() {
		return remainAmount;
	}
	public void setRemainAmount(Integer remainAmount) {
		this.remainAmount = remainAmount;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
		if(createTime!=null){
			try {
				this.setCurCreateDate(DateUtil.stringToDate(createTime, "yyyyMMddHHmmssSSS"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
	}
	public String getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
		if(modifyTime!=null){
			try {
				this.setCurModifiedDate(DateUtil.stringToDate(modifyTime, "yyyyMMddHHmmssSSS"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
	}
	public Date getCurCreateDate() {
		return curCreateDate;
	}
	public void setCurCreateDate(Date curCreateDate) {
		this.curCreateDate = curCreateDate;
	}
	public Date getCurModifiedDate() {
		return curModifiedDate;
	}
	public void setCurModifiedDate(Date curModifiedDate) {
		this.curModifiedDate = curModifiedDate;
	}
	public String getSysImageName() {
		return sysImageName;
	}
	public void setSysImageName(String sysImageName) {
		this.sysImageName = sysImageName;
	}
	public Integer getAssignedAmount() {
		return assignedAmount;
	}
	public void setAssignedAmount(Integer assignedAmount) {
		this.assignedAmount = assignedAmount;
	}
	public String getHostTypeName() {
		return hostTypeName;
	}
	public void setHostTypeName(String hostTypeName) {
		this.hostTypeName = hostTypeName;
	}
	public String getPoolId() {
		return poolId;
	}
	public void setPoolId(String poolId) {
		this.poolId = poolId;
	}
	public String getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(String checkTime) {
		this.checkTime = checkTime;
	}
	public Integer getMinimum() {
		return minimum;
	}
	public void setMinimum(Integer minimum) {
		this.minimum = minimum;
	}

    public String getInsert_date() {
        return DateUtil.dateToString(curCreateDate, "yyyy-MM-dd HH:mm:ss");
    }
    public Integer getFileType() {
        return fileType;
    }
    public void setFileType(Integer fileType) {
        this.fileType = fileType;
    }
    public String getPool_name() {
        return pool_name;
    }
    public void setPool_name(String pool_name) {
        this.pool_name = pool_name;
    }
    public Integer getMax_creating() {
        return max_creating;
    }
    public void setMax_creating(Integer max_creating) {
        this.max_creating = max_creating;
    }
	public Integer getCodeRate() {
		return codeRate;
	}
	public void setCodeRate(Integer codeRate) {
		this.codeRate = codeRate;
	}
	public Integer getFrameRate() {
		return frameRate;
	}
	public void setFrameRate(Integer frameRate) {
		this.frameRate = frameRate;
	}
    
	
}

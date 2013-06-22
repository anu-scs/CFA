class CampaignStatsCustom < ActiveRecord::Base
	self.table_name = "campaign_stats_custom"
  belongs_to :campaign
  
  attr_accessible :calls_life, :calls_today, :campaign_id, :status_code

  HR_CUSTOMER = "HR_Customer" 
  HR_AGENT = "HR_Agent"
  HR_NOANSWER = "HR_NoAnswer"
  AL = "AL"
  SVYEXT = "SVYEXT"
  PU = "PU"
  NA = "NA"
  AA = "AA"
  AB = "AB"
  B = "B"
  PM = "PM"
  SVYREC = "SVYREC"
  SVYCLM = "SVYCLM"
  SVYHU = "SVYHU"
  SVYVM = "SVYVM"
  XFER = "XFER"
  DNC = "DNC"

end

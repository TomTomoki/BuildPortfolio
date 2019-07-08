module RequestsHelper
    def check_start_end_dates
        return false if (params[:startDataTime].nil? || params[:endDateTime].nil?) || (params[:startDataTime] >= params[:endDateTime])
    end
end

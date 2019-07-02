module RequestsHelper
    def check_start_end_dates
        return false if (params[:startDataTime].nil? || params[:endDateTime].nil?) || (params[:startDataTime] >= params[:endDateTime])
    end

    def creator?(request)
        return true if request.creator_id == current_user.id
    end
end

module ApplicationHelper
  def flash_notify(flash_type)
    case flash_type
    when 'success'
      'bg-green-100 border border-green-400 text-green-700'
    when 'error'
      'bg-green-100 border border-red-400 text-red-700'
    else
      flash_type.to_s
    end
  end
end

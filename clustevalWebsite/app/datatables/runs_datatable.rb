class RunsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Run.count,
      iTotalDisplayRecords: runs.total_entries,
      aaData: data
    }
  end

private

  def data
    runs.map do |run|
      [
        h(run.id),
        h(run.absPath)
      ]
    end
  end

  def runs
    @runs ||= fetch_runs
  end

  def fetch_runs
    runs = Run.order("#{sort_column} #{sort_direction}")
    runs = runs.page(page).per_page(per_page)
    if params[:sSearch].present?
      runs = runs.where("id like :search or absPath like :search", search: "%#{params[:sSearch]}%")
    end
    runs
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id absPath]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end


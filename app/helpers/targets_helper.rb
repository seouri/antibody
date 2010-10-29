module TargetsHelper
  def target_list(targets)
    tr = []
    th = []
    th.push(content_tag(:th, "Name"))
    th.push(content_tag(:th, "Species"))
    th.push(content_tag(:th, "Antibodies"))
    tr.push(content_tag(:tr, th.join("\t").html_safe))
    targets.each do |target|
      td = []
      td.push(content_tag(:td, link_to(target.name, target)))
      td.push(content_tag(:td, link_to(target.species.name, target.species)))
      td.push(content_tag(:td, target.antibodies_count, :class => "number"))
      tr.push(content_tag(:tr, td.join("\n").html_safe))
    end
    content_tag(:h2, "Targets (#{targets.size})") + content_tag(:table, tr.join("\n").html_safe)
  end
end

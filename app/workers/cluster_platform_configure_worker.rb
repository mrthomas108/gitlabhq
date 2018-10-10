# frozen_string_literal: true

class ClusterPlatformConfigureWorker
  include ApplicationWorker
  include ClusterQueue

  def perform(cluster_id)
    Clusters::Cluster.find_by_id(cluster_id).try do |cluster|
      Clusters::Kubernetes::ConfigureService.new(cluster).execute
    end
  end
end

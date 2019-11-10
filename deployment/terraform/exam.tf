
data "template_file" "exam_values" {
  template = "${file("./exam/template_values.yaml")}"
  vars = {
    domain_name = "${var.domain_name}"
    docker_image = "${var.docker_image}"
    docker_image_tag = "${var.docker_image_tag}"
  }
}

resource "local_file" "exam_values_local_file" {
  content  = "${trimspace(data.template_file.exam_values.rendered)}"
  filename = "./exam/.cache/values.yaml"
}


resource "helm_release" "exam" {
  name       = "${var.name}"
  namespace = "${var.namespace}"
  chart = "./exam"
  version    = "${var.version}"
   values = [
    "${data.template_file.exam_values.rendered}"
  ]
}

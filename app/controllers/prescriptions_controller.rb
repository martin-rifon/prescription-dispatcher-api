require 'haml'
require 'wicked_pdf'

class PrescriptionsController < ApplicationController
  # POST /prescriptions
  def create
    ingredients = params[:prescription][:ingredients]
    patient_information = params[:prescription][:patientInformation]

    template = File.read(Rails.root.join('app', 'views', 'prescription.html.haml'))
    haml_engine = Haml::Engine.new(template)

    pdf = WickedPdf.new.pdf_from_string(
      haml_engine.render(Object.new, { ingredients: ingredients, patient_information: patient_information })
    )

    prescription_file_name = "#{Time.now.to_i}_#{patient_information['name']}.pdf"
    save_path = Rails.root.join('public', 'prescriptions', prescription_file_name)
    File.open(save_path, 'wb') do |file|
      file << pdf
    end

    path = "#{request.original_url}/#{prescription_file_name}"

    render json: { path: path }, status: :created
  end
end

defmodule BillinhoWeb.Router do
  use BillinhoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BillinhoWeb do
    pipe_through :api

    resources "/educational_institutions", EducationalInstitutionsController, except: [:new, :edit]
    resources "/students", StudentsController, except: [:new, :edit]
    resources "/enrollments", EnrollmentsController, except: [:new, :edit]
    resources "/bills", BillsController, except: [:new, :edit]
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:billinho, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: BillinhoWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end

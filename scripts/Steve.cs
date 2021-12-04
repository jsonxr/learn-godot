using Godot;



public class Steve : KinematicBody {
  // Declare member variables here. Examples:
  // private int a = 2;
  // private string b = "text";
  private int count;
  readonly private string name = "Jason";
  const float SPEED = 6;

  private Vector3 velocity = new Vector3(0, 0, 0);

  // Called when the node enters the scene tree for the first time.
  public override void _Ready() {
    GD.Print($"Hello World 2 {name}");
  }

  public override void _PhysicsProcess(float delta) {
    base._PhysicsProcess(delta);
    this.count++;
    if (Input.IsActionPressed("ui_right")) {
      velocity.x = SPEED;
    } else if (Input.IsActionPressed("ui_left")) {
      velocity.x = -SPEED;
    } else {
      velocity.x = Mathf.Lerp(velocity.x, 0, 0.1f);
    }

    if (Input.IsActionPressed("ui_up")) {
      velocity.z = -SPEED;
    } else if (Input.IsActionPressed("ui_down")) {
      velocity.z = SPEED;
    } else {
      velocity.z = Mathf.Lerp(velocity.z, 0, 0.1f);
    }

    MoveAndSlide(velocity);
  }


  //  // Called every frame. 'delta' is the elapsed time since the previous frame.
  //  public override void _Process(float delta)
  //  {
  //      
  //  }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MeteroMovemment : MonoBehaviour
{
    public Vector3 direction = new Vector3(-1, -1, 0); // 流星移動方向
    public float speed = 10f; // 流星速度

    void Update()
    {
        // 流星移動
        transform.Translate(direction.normalized * speed * Time.deltaTime);

        // 超出場景後自動銷毀
        if (transform.position.y < -10)
        {
            Destroy(gameObject);
        }
    }
}

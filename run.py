from robot import run_cli
import time, os

current_day = time.strftime('%Y_%m_%d_%H_%M_%S')
report_dir = os.path.join(os.path.dirname(__file__), f'reports/{current_day}')

def run_all_cases():
    """
    运行所有测试用例
    :return:
    """
    run_cli(['./testcases'])

def run_user_register_cases():
    """
    运行用户注册测试用例
    :return:
    """
    run_cli(['-d', report_dir, '--include', '用户注册测试', 'testcases/user_register.robot'])

def run_publish_topic_cases():
    """
    运行用户发帖测试用例
    :return:
    """
    run_cli(['-d', report_dir, '--include', '用户发帖测试', 'testcases/publish_topic.robot'])

def run_reply_topic_cases():
    """
    运行用户回帖测试用例
    :return:
    """
    run_cli(['-d', report_dir, '--include', '用户回帖测试', 'testcases/reply_topic.robot'])

if __name__ == '__main__':
    # run_all_cases()
    # run_user_register_cases()
    run_publish_topic_cases()
    # run_reply_topic_cases()

